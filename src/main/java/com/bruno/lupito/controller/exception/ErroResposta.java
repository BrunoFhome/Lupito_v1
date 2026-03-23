package com.bruno.lupito.controller.exception;

import java.time.Instant;

public class ErroResposta {

    private int status;
    private String erro;
    private String mensagem;
    private Instant timestamp;

    public ErroResposta(int status, String erro, String mensagem) {
        this.status = status;
        this.erro = erro;
        this.mensagem = mensagem;
        this.timestamp = Instant.now();
    }

    public int getStatus() { return status; }
    public String getErro() { return erro; }
    public String getMensagem() { return mensagem; }
    public Instant getTimestamp() { return timestamp; }
}
