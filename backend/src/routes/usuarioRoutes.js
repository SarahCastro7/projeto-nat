import {usuarioController} from '../controllers/usuarioControllers.js';
import {Router} from 'express';

const router = Router();

router.get ('/usuario/login', 
    usuarioController.getByLogin );

export default router; 