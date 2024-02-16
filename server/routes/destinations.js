import express from "express";
const router = express.Router();
import DestinationController from "../controllers/DestinationController"

router.get('/', DestinationController.getAllDestination);
router.get('/top', DestinationController.getTopDestination);
router.get('/:key', DestinationController.searchDestination);


module.exports = router
