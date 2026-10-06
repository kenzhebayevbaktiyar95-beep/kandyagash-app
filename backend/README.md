const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 4000;

app.use(cors({ origin: process.env.CLIENT_URL || '*', credentials: true }));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const users = [];
const orders = [];
const payments = [];

app.get('/api/health', (req, res) => {
  res.json({
    status: 'ok',
    service: 'Qandyagash Life API',
    timestamp: new Date().toISOString(),
  });
});

app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: 'Email and password are required' });
  }

  let user = users.find((item) => item.email === email);

  if (!user) {
    user = {
      id: uuidv4(),
      email,
      password,
      createdAt: new Date().toISOString(),
    };
    users.push(user);
  }

  return res.status(200).json({
    message: 'Login successful',
    user: {
      id: user.id,
      email: user.email,
    },
    token: 'demo_jwt_token_' + user.id,
  });
});

app.post('/api/orders/taxi', (req, res) => {
  const { userId, from, to, passengerCount, price } = req.body;

  if (!from || !to || !userId) {
    return res.status(400).json({ message: 'Missing required taxi order fields' });
  }

  const order = {
    id: uuidv4(),
    type: 'taxi',
    userId,
    from,
    to,
    passengerCount: passengerCount || 1,
    price: price || 1200,
    status: 'created',
    createdAt: new Date().toISOString(),
  };

  orders.push(order);

  return res.status(201).json({
    message: 'Taxi order created',
    order,
  });
});

app.post('/api/orders/food', (req, res) => {
  const { userId, items, total } = req.body;

  if (!userId || !items || items.length === 0) {
    return res.status(400).json({ message: 'Missing food order fields' });
  }

  const order = {
    id: uuidv4(),
    type: 'food',
    userId,
    items,
    total: total || 2500,
    status: 'pending',
    createdAt: new Date().toISOString(),
  };

  orders.push(order);

  return res.status(201).json({
    message: 'Food order created',
    order,
  });
});

app.post('/api/orders/delivery', (req, res) => {
  const { userId, from, to, timeEstimate } = req.body;

  if (!userId || !from || !to) {
    return res.status(400).json({ message: 'Missing delivery details' });
  }

  const order = {
    id: uuidv4(),
    type: 'delivery',
    userId,
    from,
    to,
    timeEstimate: timeEstimate || '30-45 минут',
    status: 'accepted',
    createdAt: new Date().toISOString(),
  };

  orders.push(order);

  return res.status(201).json({
    message: 'Delivery order created',
    order,
  });
});

app.get('/api/orders', (req, res) => {
  res.json({ orders });
});

app.post('/api/payments/create', (req, res) => {
  const { userId, amount, currency, provider, orderId } = req.body;

  if (!userId || !amount || !provider) {
    return res.status(400).json({ message: 'Missing payment info' });
  }

  const payment = {
    id: uuidv4(),
    userId,
    orderId: orderId || null,
    amount,
    currency: currency || 'KZT',
    provider,
    status: 'pending',
    createdAt: new Date().toISOString(),
  };

  payments.push(payment);

  return res.status(201).json({
    message: 'Payment initialized',
    payment,
    gateway: {
      provider,
      mode: process.env.PAYMENT_PROVIDER || 'mock',
      redirectUrl: 'https://example.com/payment-success',
    },
  });
});

app.post('/api/payments/confirm', (req, res) => {
  const { paymentId } = req.body;

  const payment = payments.find((item) => item.id === paymentId);

  if (!payment) {
    return res.status(404).json({ message: 'Payment not found' });
  }

  payment.status = 'success';
  payment.confirmedAt = new Date().toISOString();

  return res.status(200).json({
    message: 'Payment confirmed',
    payment,
  });
});

app.get('/api/payments', (req, res) => {
  res.json({ payments });
});

app.get('/api/users', (req, res) => {
  res.json({ users });
});

app.listen(PORT, () => {
  console.log(`Qandyagash Life backend running on http://localhost:${PORT}`);
});
