import express from 'express';
import {usuarioRouter} from '../routes/usuarioRoutes.js';

const app = express();
const PORT = process.env.PORT || 3000; 

app.use(express.json());
app.use('/usuarios', usuarioRouter);

app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`)
})

// server->routes->service->controller->repository->config