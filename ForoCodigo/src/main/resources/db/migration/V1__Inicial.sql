CREATE TABLE usuario (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(255),
                         correo_electronico VARCHAR(255) UNIQUE,
                         contrasena VARCHAR(255)
);

CREATE TABLE perfil (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        nombre VARCHAR(255)
);

CREATE TABLE usuario_perfil (
                                usuario_id BIGINT,
                                perfil_id BIGINT,
                                PRIMARY KEY (usuario_id, perfil_id),
                                FOREIGN KEY (usuario_id) REFERENCES usuario(id),
                                FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);

CREATE TABLE curso (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       nombre VARCHAR(255),
                       categoria VARCHAR(255)
);

CREATE TABLE topico (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        titulo VARCHAR(255),
                        mensaje TEXT,
                        fecha_creacion TIMESTAMP,
                        status VARCHAR(255),
                        autor_id BIGINT,
                        curso_id BIGINT,
                        FOREIGN KEY (autor_id) REFERENCES usuario(id),
                        FOREIGN KEY (curso_id) REFERENCES curso(id)
);

CREATE TABLE respuesta (
                           id BIGINT AUTO_INCREMENT PRIMARY KEY,
                           mensaje TEXT,
                           fecha_creacion TIMESTAMP,
                           solucion BOOLEAN,
                           autor_id BIGINT,
                           topico_id BIGINT,
                           FOREIGN KEY (autor_id) REFERENCES usuario(id),
                           FOREIGN KEY (topico_id) REFERENCES topico(id)
);
