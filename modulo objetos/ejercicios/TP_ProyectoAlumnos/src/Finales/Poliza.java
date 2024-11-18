/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales;

/**
 *
 * @author valen
 */
public class Poliza {
    private int montoAsegurado;
    private double cuota;
    private Fecha fechaIni;
    private Fecha fechaFin;
    private Cliente cli;

    public Poliza(int montoAsegurado, double cuota, int diaIni, int mesIni, int anioIni, int diaFin, int mesFin, int anioFin, Cliente unCliente) {
        this.montoAsegurado = montoAsegurado;
        this.cuota = cuota;
        this.fechaIni = new Fecha (diaIni, mesIni, anioIni);
        this.fechaFin = new Fecha (diaFin, mesFin, anioFin);
        this.cli = unCliente;
    }

    public double getMontoAsegurado() {
        return montoAsegurado;
    }

    public void setMontoAsegurado(int montoAsegurado) {
        this.montoAsegurado = montoAsegurado;
    }

    public double getCuota() {
        return cuota;
    }

    public void setCuota(double cuota) {
        this.cuota = cuota;
    }

    public Fecha getFechaIni() {
        return fechaIni;
    }

    public void setFechaIni(Fecha fechaIni) {
        this.fechaIni = fechaIni;
    }

    public Fecha getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Fecha fechaFin) {
        this.fechaFin = fechaFin;
    }

    
    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }
    
    public String toString (){
        return "La poliza tiene como monto asegurado $: " + this.getMontoAsegurado() + ", su cuota es de $ " + this.getCuota() + ". Su fecha de inicio fue " + this.getFechaIni().toString() + " y su fin fue/ sera en la fecha " + this.getFechaFin().toString();
    }
}
