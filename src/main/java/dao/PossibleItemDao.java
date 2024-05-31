package dao;

import entity.PossibleItem;

import java.util.List;

public interface PossibleItemDao extends GenericDao<PossibleItem, Integer>, AutoCloseable {
    void saveImages(PossibleItem possibleItem);
    List<String> getBase64ImagesByItemId(Integer itemId);
    List<byte[]> getImageBytesByItemId(Integer itemId);
    void close();
}
