package lt.vu.mif.ps5.kupra.service.implementation;

import java.util.List;

import lt.vu.mif.ps5.kupra.dao.UnitDao;
import lt.vu.mif.ps5.kupra.entity.Unit;
import lt.vu.mif.ps5.kupra.service.UnitService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class UnitServiceImpl implements UnitService {

	static Logger log = Logger.getLogger(UnitServiceImpl.class.getName());
	
	private UnitDao unitDao;
	
	@Autowired
	public UnitServiceImpl(UnitDao unitDao) {
		this.unitDao = unitDao;
	}
	
	@Transactional(readOnly = true)
	@Override
	public Unit getUnit(long unitId) {
		return unitDao.get(unitId);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Unit> getAll() {
		return unitDao.getAll();
	}

	@Transactional
	@Override
	public long addUnit(String name, String abbreviation) {
		Unit unit = new Unit();
		unit.setName(name);
		unit.setAbbreviation(abbreviation);
		return unit.getUnitId();
	}
	
}