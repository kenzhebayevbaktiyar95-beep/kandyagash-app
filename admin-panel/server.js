const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

const summary = {
  city: 'Qandyagash',
  activeUsers: 1842,
  todayOrders: 128,
  monthlyRevenue: 1420000,
  paymentSuccessRate: 98.7,
};

const dashboardData = {
  overview: summary,
  revenueByProvider: [
    { provider: 'Kaspi', amount: 760000 },
    { provider: 'Halyk', amount: 420000 },
    { provider: 'Bank Card', amount: 240000 },
  ],
  recentOrders: [
    { id: 'A-1042', type: 'Taxi', status: 'completed', amount: 1200 },
    { id: 'F-2021', type: 'Food', status: 'in_progress', amount: 2500 },
    { id: 'D-550', type: 'Delivery', status: 'pending', amount: 800 },
    { id: 'P-778', type: 'Payment', status: 'completed', amount: 3500 },
  ],
  services: [
    { name: 'Taxi', active: true, orders: 64 },
    { name: 'Food', active: true, orders: 41 },
    { name: 'Delivery', active: true, orders: 19 },
    { name: 'Government', active: true, orders: 12 },
  ],
};

app.get('/api/health', (req, res) => {
  res.json({ ok: true, service: 'Qandyagash admin panel', timestamp: new Date().toISOString() });
});

app.get('/api/dashboard', (req, res) => {
  res.json(dashboardData);
});

app.get('/api/orders', (req, res) => {
  res.json(dashboardData.recentOrders);
});

app.get('/api/services', (req, res) => {
  res.json(dashboardData.services);
});

app.listen(port, () => {
  console.log(`Qandyagash admin panel running at http://localhost:${port}`);
});
