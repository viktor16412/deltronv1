package com.deltron.models;

import java.util.UUID;

public class Role {
    private UUID idRol;
    private String nombre;
    private String descripcion;

    // Constructores, Getters y Setters
    
    public Role() {
    }

    public UUID getIdRol() {
        return idRol;
    }

    public void setIdRol(UUID idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}