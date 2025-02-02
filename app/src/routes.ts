import express, { Request, Response, Router } from "express";
import { StatusCodes } from "http-status-codes";
import getTime from "./time-service.js"

const router = Router();

router.get("/time", doGetTime());

function doGetTime(): any {
    return (req: Request, res: Response) => {
        res.status(StatusCodes.OK).json({
            timestamp: getTime(),
            ip: req.ip // In a second iteration we could first check the x-forward header for cases in which client is behind a chain of proxies
        });
    };
}

export default router;
