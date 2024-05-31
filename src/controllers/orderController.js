const orderService = require('../services/orderService');

async function createOrder(req, res) {
  try {
    const order = await orderService.createOrder(req.body);
    res.status(201).json(order);
  } catch (error) {
    res.status(500).json({ error: 'Failed to create order' });
  }
}

async function getOrders(req, res) {
  try {
    const orders = await orderService.getOrders();
    res.status(200).json(orders);
  } catch (error) {
    res.status(500).json({ error: 'Failed to retrieve orders' });
  }
}

module.exports = {
  createOrder,
  getOrders
};
