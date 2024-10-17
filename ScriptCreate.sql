-- Cria a tabela TB_STATUS
CREATE TABLE TB_STATUS (
    id_sts VARCHAR(5) PRIMARY KEY,
    desc_sts VARCHAR(50)
);

-- Cria a tabela TB_SNSR_PH
CREATE TABLE TB_SNSR_PH (
    id_sns_ph INT PRIMARY KEY,
    status VARCHAR(5) NOT NULL,
    nvl_ph INT,
    dat_alter DATE,
    FOREIGN KEY (status) REFERENCES TB_STATUS(id_sts)
);

-- Cria a tabela TB_SNSR_AGUA
CREATE TABLE TB_SNSR_AGUA (
    id_sns_agua INT PRIMARY KEY,
    status VARCHAR(5) NOT NULL,
    nvl_agua INT,
    dat_alter DATE,
    FOREIGN KEY (status) REFERENCES TB_STATUS(id_sts)
);

-- Cria a tabela TB_SNSR_NUTRI
CREATE TABLE TB_SNSR_NUTRI (
    id_sns_nutri INT PRIMARY KEY,
    status VARCHAR(5) NOT NULL,
    nvl_p INT,
    nvl_k INT,
    dat_alter DATE,
    FOREIGN KEY (status) REFERENCES TB_STATUS(id_sts)
);

-- Cria a tabela TB_CULTIVOS
CREATE TABLE TB_CULTIVOS (
    id_cultivo INT PRIMARY KEY,
    nome_prod VARCHAR(15),
    dat_cad DATE,
    dat_alter DATE
);

-- Cria a tabela TB_MNTOR
CREATE TABLE TB_MNTOR (
    id_mntor INT PRIMARY KEY,
    id_cultivo INT NOT NULL,
    status VARCHAR(5) NOT NULL,
    nvl_ph INT,
    nvl_agua INT,
    nvl_p INT,
    nvl_k INT,
    dat_cad DATE,
    dat_alter DATE,
    FOREIGN KEY (id_cultivo) REFERENCES TB_CULTIVOS(id_cultivo),
    FOREIGN KEY (status) REFERENCES TB_STATUS(id_sts)
);

-- Cria a tabela TB_HIST
CREATE TABLE TB_HIST (
    id_hist INT PRIMARY KEY,
    id_cultivo INT NOT NULL,
    status VARCHAR(5) NOT NULL,
    nvl_ph INT,
    nvl_agua INT,
    nvl_p INT,
    nvl_k INT,
    dat_cad DATE,
    FOREIGN KEY (id_cultivo) REFERENCES TB_CULTIVOS(id_cultivo),
    FOREIGN KEY (status) REFERENCES TB_STATUS(id_sts)
);