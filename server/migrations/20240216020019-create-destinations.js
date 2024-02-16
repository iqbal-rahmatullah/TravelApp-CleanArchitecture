'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('destinations', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      name: {
        type: Sequelize.STRING(50),
      },
      category: {
        type: Sequelize.STRING(20)
      },
      cover: {
        type: Sequelize.STRING(50)
      },
      rate: {
        type: Sequelize.DOUBLE
      },
      rate_count: {
        type: Sequelize.INTEGER
      },
      location: {
        type: Sequelize.STRING(255)
      },
      description: {
        type: Sequelize.STRING(1000)
      },
      images: {
        type: Sequelize.STRING
      },
      facilities: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('destinations');
  }
};