/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nabil.dao;

import com.nabil.entity.MahasiswaEntity;
import com.nabil.util.HibernateUtil;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Xyraclius
 */
public class MahasiswaDAO {

    public boolean save(MahasiswaEntity mhs) { //Save Data Mahasiswa
        try { //Save Data
            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(mhs);

            tx.commit();
            session.close();
            return true;
        } catch (HibernateException e) {

        }
        return false;
    }

    public boolean update(MahasiswaEntity mhs) { //Update Biodata Mahasiswa
        try { //Update Data
            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            session.beginTransaction();

            session.update(mhs);

            session.getTransaction().commit();
            session.close();
            return true;
        } catch (HibernateException e) {

        }
        return false;
    }

    public boolean delete(MahasiswaEntity mhs) { //Delete Data Mahasiswa
        try {
            SessionFactory factory = HibernateUtil.getSessionFactory();
            Session session = factory.openSession();
            session.beginTransaction();

            session.delete(mhs);
            session.getTransaction().commit();
            session.close();
            return true;
        } catch (HibernateException e) {
        }
        return false;
    }

    public static ArrayList getAllMahasiswa() { //Show All Data
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();
        ArrayList<MahasiswaEntity> list = (ArrayList<MahasiswaEntity>) session.createCriteria(MahasiswaEntity.class).list();
        ArrayList<MahasiswaEntity> pList = list;
        session.beginTransaction();
        session.close();

        return pList;
    }

    public static MahasiswaEntity findMahasiswa(int id) { //Find Biodata Mahasiswa
        SessionFactory factory = HibernateUtil.getSessionFactory();
        Session session = factory.openSession();

        MahasiswaEntity mhs = (MahasiswaEntity) session.get(MahasiswaEntity.class, id);

        return mhs;
    }

}
