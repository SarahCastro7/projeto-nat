import {query} from '../config/db.js';

export const usuarioRepository = {
     async getByLogin (email, senha) {
        const sql = " select * from usuario where email = $1 and password = $2 ;" ;
        const banco_responde = await query (sql, [email, senha]); 
        return banco_responde.rows[0];
    },

    async getById (id) {
        const sql = "SELECT * FROM usuario WHERE id = $1;";
        const banco_responde = await query(sql, [id]);
        return banco_responde.rows[0];
    }

}