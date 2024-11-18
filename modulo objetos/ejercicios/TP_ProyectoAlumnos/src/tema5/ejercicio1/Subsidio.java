/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5.ejercicio1;

/**
 *
 * @author valen
 */
public class Subsidio {
    private int monto;
    private String motivo;
    private boolean otorgado = false;

    public Subsidio(int monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
    }

    public int getMonto() {
        return monto;
    }

    private void setMonto(int monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    private void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
}
