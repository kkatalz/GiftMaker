package dto;

import entity.CustomBuilder;

import javax.servlet.http.Part;
import java.util.ArrayList;
import java.util.List;

public class PossibleItemDto {

    private Integer id;
    private String name;
    private String price;
    private String description;
    private String age;
    private List<Part> parts = new ArrayList<>();

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Part> getParts() {
        return parts;
    }

    public void setPart(List<Part> parts) {
        this.parts = parts;
    }

    public static class Builder implements CustomBuilder<PossibleItemDto> {
        PossibleItemDto possibleItem = new PossibleItemDto();

        public Builder setId(Integer id) {
            possibleItem.id = id;
            return this;
        }


        public Builder setName(String name) {
            possibleItem.name = name;
            return this;
        }

        public Builder setPrice(String price) {
            possibleItem.price = price;
            return this;
        }

        public Builder setDescription(String description) {
            possibleItem.description = description;
            return this;
        }


        public Builder setAge(String age) {
            possibleItem.age = age;
            return this;
        }


        public Builder setParts(List<Part> part) {
            possibleItem.parts = part;
            return this;
        }


        @Override
        public PossibleItemDto build() {
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }


    @Override
    public String toString() {
        return "PossibleItemDto{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", age=" + age +
                '}';
    }
}
