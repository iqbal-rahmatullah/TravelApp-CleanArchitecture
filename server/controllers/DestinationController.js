import { Op, Sequelize } from "sequelize"
import models from "../models/"

class DestinationController {
    static async getAllDestination(req, res, next) {
        try {
            const result = await models.destinations.findAll({})
            if (result.length) {
                res.status(200).json({
                    "status": "success",
                    "message": "Get Data Successfully",
                    "data": result
                })
            } else {
                res.status(404).json({
                    "status": "Not Found",
                    "message": "Destination not found",
                    "data": {}
                })
            }
        } catch (error) {
            res.status(500).json({
                "status": "erorr",
                "message": "Internal Server Error"
            })
        }
    }

    static async getTopDestination(req, res, next) {
        try {
            const result = await models.destinations.findAll({
                order: [["rate", "DESC"]],
                limit: 3
            })

            if (result.length) {
                res.status(200).json({
                    "status": "success",
                    "message": "Get Top Destination Successfully",
                    "data": result
                })
            } else {
                res.status(404).json({
                    "status": "Not Found",
                    "message": "Destination not found",
                    "data": []
                })
            }
        } catch (error) {
            res.status(500).json({
                "status": "erorr",
                "message": "Internal Server Error"
            })
        }
    }

    static async searchDestination(req, res, next) {
        try {
            const { key } = req.params
            const result = await models.destinations.findAll({
                where: {
                    name: {
                        [Op.like]: `%${key}%`,
                    }
                }
            })
            if (result.length) {
                res.status(200).json(
                    {
                        "status": "success",
                        "message": "Get Data Successfully",
                        "data": result
                    }
                )
            } else {
                res.status(404).json({
                    "status": "Not Found",
                    "message": "Your search is not available",
                    "data": null
                })
            }
        } catch (error) {
            res.status(500).json({
                "status": "erorr",
                "message": error.message
            })
        }
    }
}

module.exports = DestinationController