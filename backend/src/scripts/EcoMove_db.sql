select * from usuarios
select * from comentarios
select * from curtidas
select * from atividades

create table usuarios (
	usuario_id serial primary key,
    usuario_nome text NOT NULL,
    usuario_email character varying NOT NULL,
    usuario_senha character varying NOT NULL,
    foto_url character varying
);

CREATE TABLE atividades (
    atividade_id serial NOT NULL PRIMARY KEY,
    usuario_id serial NOT NULL,
    tipo character varying NOT NULL,
    distancia_metros numeric NOT NULL,
    duracao_minutos integer NOT NULL,
    co2_kg numeric NOT NULL,
    data_iso timestamp with time zone NOT NULL,
    CONSTRAINT atividade_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
);

CREATE TABLE comentarios (
    comentario_id serial NOT NULL PRIMARY KEY,
    usuario_id serial NOT NULL,
    atividade_id serial NOT NULL,
    CONSTRAINT comentarios_usuarios_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.usuarios (usuario_id) MATCH SIMPLE,
    CONSTRAINT comentario_atividades_id_fkey FOREIGN KEY (atividade_id)
        REFERENCES public.atividades (atividade_id) MATCH SIMPLE
);

CREATE TABLE curtidas (
    curtida_id serial NOT NULL PRIMARY KEY,
    usuario_id serial NOT NULL,
    atividade_id serial NOT NULL,
    CONSTRAINT curtida_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES public.usuarios (usuario_id) MATCH SIMPLE,
    CONSTRAINT curtida_atividade_id_fkey FOREIGN KEY (atividade_id)
        REFERENCES public.atividades (atividade_id) MATCH SIMPLE
);

ALTER TABLE comentarios
ADD COLUMN texto text ;

-- USUÁRIOS
INSERT INTO usuarios 
(usuario_nome, usuario_email, usuario_senha, foto_url)
VALUES
('João Silva', 'joao@email.com', '123456', 'https://exemplo.com/joao.jpg'),
('Maria Souza', 'maria@email.com', '123456', 'https://exemplo.com/maria.jpg'),
('Pedro Santos', 'pedro@email.com', '123456', 'https://exemplo.com/pedro.jpg'),
('Ana Oliveira', 'ana@email.com', '123456', 'https://exemplo.com/ana.jpg'),
('Lucas Costa', 'lucas@email.com', '123456', 'https://exemplo.com/lucas.jpg');


-- ATIVIDADES
INSERT INTO atividades
(usuario_id, tipo, distancia_metros, duracao_minutos, co2_kg, data_iso)
VALUES
(1, 'Corrida', 5000, 30, 1.20, '2026-09-25 07:30:00-03'),
(2, 'Ciclismo', 12000, 45, 2.50, '2026-09-25 08:00:00-03'),
(3, 'Caminhada', 3500, 40, 0.80, '2026-09-26 17:30:00-03'),
(1, 'Ciclismo', 20000, 60, 4.20, '2026-09-27 09:00:00-03'),
(4, 'Corrida', 7500, 45, 1.80, '2026-09-27 18:00:00-03'),
(5, 'Caminhada', 4200, 50, 0.95, '2026-09-28 07:00:00-03'),
(2, 'Corrida', 6000, 35, 1.45, '2026-09-28 18:30:00-03'),
(3, 'Ciclismo', 15000, 50, 3.10, '2026-09-29 08:30:00-03');



-- COMENTÁRIOS
INSERT INTO comentarios
(usuario_id, atividade_id)
VALUES
(2, 1),
(3, 1),
(1, 2),
(4, 2),
(5, 3),
(2, 4),
(3, 5),
(1, 6),
(4, 7),
(5, 8);


-- CURTIDAS
INSERT INTO curtidas
(usuario_id, atividade_id)
VALUES
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(3, 2),
(5, 2),
(1, 3),
(2, 3),
(4, 4),
(5, 4),
(2, 5),
(3, 5),
(5, 6),
(1, 7),
(4, 7),
(2, 8),
(3, 8);