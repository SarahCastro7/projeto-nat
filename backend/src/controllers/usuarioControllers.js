import {usuarioRepository} from '../repositories/usuarioRepository.js';

export const usuarioController =  {
    async getByLogin(req, res) {
        try{
            const {email, senha} = req.body;
            if (!email) {
                return res.status(400).json({error: 'o campo email é obrigatório'});
            }
            if (!senha) {
                return res.status(400).json({error: 'o campo senha é obrigatório'});
            }

        } catch (error) {
            res.status(500).json({error: 'erro ao buscar usuário por login'});
        }

        try {
            const usuario = await usuarioRepository.getByLogin(req.body);
            if (!usuario) {
                return res.status(404).json({error: 'usuário não encontrado ou dados incorretos'});
            } else {
             return res.status(200).json({
                id: usuario.id,
                nome: usuario.nome
                });
            }
    }

};