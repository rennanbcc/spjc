USE DBSJPC;

ALTER TABLE Juizado ADD salaAudiencia VARCHAR(100);
ALTER TABLE Testemunha ADD idade INTEGER;
ALTER TABLE Execucao ADD pago BOOL NOT NULL DEFAULT false;
ALTER TABLE Execucao ADD numeroParcelasPagas INTEGER UNSIGNED NOT NULL DEFAULT 0;
