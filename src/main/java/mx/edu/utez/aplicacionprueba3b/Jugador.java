package mx.edu.utez.aplicacionprueba3b;

public class Jugador {
    private String nombre;
    private Integer edad;
    private String rangoFide;
    private String email;
    private String fotoPerfil;
    private String categoria; // 6 atributo autogenerado por el sistema

    public Jugador() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getRangoFide() {
        return rangoFide;
    }

    public void setRangoFide(String rangoFide) {
        this.rangoFide = rangoFide;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFotoPerfil() {
        return fotoPerfil;
    }

    public void setFotoPerfil(String fotoPerfil) {
        this.fotoPerfil = fotoPerfil;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}
