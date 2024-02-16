'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class destinations extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  destinations.init({
    name: DataTypes.STRING(50),
    category: DataTypes.STRING(20),
    cover: DataTypes.STRING(50),
    rate: DataTypes.DOUBLE,
    rate_count: DataTypes.INTEGER,
    location: DataTypes.STRING(255),
    description: DataTypes.STRING(1000),
    images: DataTypes.STRING,
    facilities: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'destinations',
  });
  return destinations;
};