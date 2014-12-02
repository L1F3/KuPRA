/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package lt.vu.mif.ps5.kupra.dao;

import java.util.List;

/**
 *
 * @author tomas_000
 * @param <T>
 */
public interface GenericDao<T> {
    
    T get(long id);
    
    List<T> getAll();
    
    void persist(T acc);
    
    void delete(long id);

}
