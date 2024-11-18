/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Finales.objetos20242;

/**
 *
 * @author valen
 */
public class Poliza {
    private double monto;
    private double valorCuota;
    private Fecha fechaC;
    private Fecha fechaF;
    private Cliente cli;

    public Poliza(double monto, double valorCuota, Fecha fechaC, Fecha fechaF, Cliente cli) {
        this.monto = monto;
        this.valorCuota = valorCuota;
        this.fechaC = fechaC;
        this.fechaF = fechaF;
        this.cli = cli;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public double getValorCuota() {
        return valorCuota;
    }

    public void setValorCuota(double valorCuota) {
        this.valorCuota = valorCuota;
    }

    public Fecha getFechaC() {
        return fechaC;
    }

    public void setFechaC(Fecha fechaC) {
        this.fechaC = fechaC;
    }

    public Fecha getFechaF() {
        return fechaF;
    }

    public void setFechaF(Fecha fechaF) {
        this.fechaF = fechaF;
    }

    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }
    
    public String toString (){
        return "Monto poliza $" + this.getMonto() + ". Valor de la cuota $" + this.getValorCuota() + ". Fecha inicio " + this.getFechaC() + ". Fecha fin " + this.getFechaF();
    }
}
