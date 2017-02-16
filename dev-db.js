const faker = require('faker');
const uuid = require('uuid-v4');

const generateTransaction = (sender, receiver) => ({
  amount: faker.random.number(),
  created_at: faker.date.past().getTime(),
  description: faker.lorem.words(),
  id: uuid(),
  receiver,
  sender,
});

const generateTransactions = (num, sender, receiver, transactions) => {
  if (num === 0) {
    return transactions;
  }

  return [
    ...generateTransactions(num - 1, receiver, sender, transactions),
    generateTransaction(sender, receiver)
  ];
};

module.exports = () => ({
  transactions: generateTransactions(10, uuid(), uuid(), [])
});
