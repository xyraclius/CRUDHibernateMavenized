package com.nabil.entity;
// Generated Dec 13, 2017 2:41:53 PM by Hibernate Tools 4.3.1



/**
 * MahasiswaEntity generated by hbm2java
 */
public class MahasiswaEntity  implements java.io.Serializable {

     private int id;
     private String nama;
     private String kelas;
     private String jeniskelamin;

    public MahasiswaEntity() {
    }

	
    public MahasiswaEntity(int id) {
        this.id = id;
    }
    public MahasiswaEntity(int id, String nama, String kelas, String jeniskelamin) {
       this.id = id;
       this.nama = nama;
       this.kelas = kelas;
       this.jeniskelamin = jeniskelamin;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public String getNama() {
        return this.nama;
    }
    
    public void setNama(String nama) {
        this.nama = nama;
    }
    public String getKelas() {
        return this.kelas;
    }
    
    public void setKelas(String kelas) {
        this.kelas = kelas;
    }
    public String getJeniskelamin() {
        return this.jeniskelamin;
    }
    
    public void setJeniskelamin(String jeniskelamin) {
        this.jeniskelamin = jeniskelamin;
    }


}

