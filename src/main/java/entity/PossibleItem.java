package entity;

import java.io.File;
import java.math.BigDecimal;

public class PossibleItem {
    private int id;
    private String name;
    private BigDecimal price;
    private String description;
    private int age;
    private String base64Image; // might be the proper format to display on the page
    private File imageForInsertion; // should be used in insertion to the table

    public static class Builder implements CustomBuilder<PossibleItem> {
        PossibleItem possibleItem = new PossibleItem();

        public Builder setId(int id) {
            possibleItem.id = id;
            return this;
        }


        public Builder setName(String name) {
            possibleItem.name = name;
            return this;
        }

        public Builder setPrice(BigDecimal price) {
            possibleItem.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            possibleItem.description = description;
            return this;
        }


        public Builder age(int age) {
            possibleItem.age = age;
            return this;
        }

        public Builder setBase64Image(String base64Image) {
            possibleItem.base64Image = base64Image;
            return this;
        }

        public Builder setImageForInsertion(File imageForInsertion) {
            possibleItem.imageForInsertion = imageForInsertion;
            return this;
        }


        @Override
        public PossibleItem build() {
            return possibleItem;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public File getImageForInsertion() {
        return imageForInsertion;
    }

    public void setImageForInsertion(File imageForInsertion) {
        this.imageForInsertion = imageForInsertion;
    }

    @Override
    public String toString() {
        return "PossibleItem{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", age=" + age +
                ", base64Image='" + base64Image + '\'' +
                ", imageForInsertion=" + imageForInsertion +
                '}';
    }
}
