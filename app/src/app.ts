import express from "express";
import cors from "cors";
import helmet from "helmet";
import dotenv from "dotenv";

import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const envPath = path.resolve(__dirname, "../.env");

dotenv.config({ path: envPath });

const PORT = parseInt(process.env.PORT as string, 10)
const app = express();

app.use(express.json())
app.use(cors())
app.use(helmet())

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`)
})