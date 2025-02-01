import express, { Request, Response, Router } from "express";
import { StatusCodes } from "http-status-codes";

const router = Router();

router.get("/time", (req: Request, res: Response) => {
    res.status(StatusCodes.OK).json({
        timestamp: new Date().toISOString(),
        ip: req.ip
    });
});

export default router;
