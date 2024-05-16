package entity;

import java.io.File;
import java.math.BigDecimal;

public class Item {
    private int id;
    private Category category;
    private String name;
    private BigDecimal price;
    private String description;
    private int amount;
    private int age;
    private String base64Image; // might be the proper format to display on the page
    private File imageForInsertion; // should be used in insertion to the table

    public static class Builder implements CustomBuilder<Item> {
        Item item = new Item();

        public Builder setId(int id) {
            item.id = id;
            return this;
        }

        public Builder setCategory(Category category) {
            item.category = category;
            return this;
        }

        public Builder setName(String name) {
            item.name = name;
            return this;
        }

        public Builder setPrice(BigDecimal price) {
            item.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            item.description = description;
            return this;
        }

        public Builder setAmount(int amount) {
            item.amount = amount;
            return this;
        }

        public Builder age(int age) {
            item.age = age;
            return this;
        }

        public Builder setBase64Image(String base64Image) {
            item.base64Image = base64Image;
            return this;
        }

        public Builder setImageForInsertion(File imageForInsertion) {
            item.imageForInsertion = imageForInsertion;
            return this;
        }


        @Override
        public Item build() {
            return item;
        }
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", category=" + category +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", age=" + age +
                '}';
    }
}
