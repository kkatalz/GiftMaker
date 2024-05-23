package service;

import converter.PossibleItemDtoConverter;
import dao.DaoFactory;
import dao.PossibleItemDao;
import dto.PossibleItemDto;
import entity.PossibleItem;

import java.util.List;
import java.util.Optional;

public class PossibleItemService {
    private final DaoFactory daoFactory;

    public PossibleItemService(DaoFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    private static class Holder {
        static final PossibleItemService Instance = new PossibleItemService(DaoFactory.getDaoFactory());
    }

    public static PossibleItemService getInstance() {
        return Holder.Instance;
    }


    public List<PossibleItem> getAllPossibleItems() {
        try(PossibleItemDao possibleItemDao = daoFactory.createPossibleItemDao()) {
            return possibleItemDao.getAll();
        }
    }

    public Optional<PossibleItem> getPossibleItemById(Integer id) {
        try(PossibleItemDao possibleItemDao = daoFactory.createPossibleItemDao()) {
            return possibleItemDao.getById(id);
        }
    }

    public void create(PossibleItemDto dto) {
        PossibleItem possibleItem = PossibleItemDtoConverter.toPossibleItem(dto);
        try(PossibleItemDao possibleItemDao = daoFactory.createPossibleItemDao()) {
            possibleItemDao.create(possibleItem);
        }
    }


    public void update(PossibleItemDto dto) {
        PossibleItem possibleItem = PossibleItemDtoConverter.toPossibleItem(dto);
        try(PossibleItemDao possibleItemDao = daoFactory.createPossibleItemDao()) {
            possibleItemDao.update(possibleItem);
        }
    }

    public void delete(Integer id) {
        try(PossibleItemDao possibleItemDao = daoFactory.createPossibleItemDao()) {
            possibleItemDao.delete(id);
        }
    }

}
