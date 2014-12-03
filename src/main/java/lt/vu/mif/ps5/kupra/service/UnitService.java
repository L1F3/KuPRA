package lt.vu.mif.ps5.kupra.service;

import java.util.List;
import lt.vu.mif.ps5.kupra.entity.Unit;

public interface UnitService {
	
	Unit getUnit(long unitId);

    List<Unit> getAll();

    long addUnit(String name, String abbreviation);
    
    void deleteUnit(long id);
    
    void updateUnit(long id, String abbreviation, String name);
}