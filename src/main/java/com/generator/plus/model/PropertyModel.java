package com.generator.plus.model;

public class PropertyModel {

    private static final String BASE_TYPE = "java.lang.";

    private String typeName;

    private String fullTypeName;

    private String name;

    private String description;

    private String methodPropertyName;

    private String columnName;

    private String columnDefault;

    private String columnType;

    public PropertyModel() {
    }

    public PropertyModel(Class typeClass, String name, String description, String columnName, String columnDefault, String columnType) {
        this.name = name;
        this.description = description;

        String fullTypeName = typeClass.getName();
        this.typeName = typeClass.getSimpleName();

        if("Integer".equals(typeName) && null != columnType && columnType.contains("unsigned")) {
            this.typeName = "Long";
        }

        if(fullTypeName.startsWith(BASE_TYPE)) {
            this.fullTypeName = null;
        } else {
            this.fullTypeName = fullTypeName;
        }
        this.methodPropertyName = name.substring(0,1).toUpperCase().concat(name.substring(1));
        this.columnName = columnName;
        this.columnDefault = columnDefault;
        this.columnType = columnType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getFullTypeName() {
        return fullTypeName;
    }

    public void setFullTypeName(String fullTypeName) {
        this.fullTypeName = fullTypeName;
    }

    public String getMethodPropertyName() {
        return methodPropertyName;
    }

    public void setMethodPropertyName(String methodPropertyName) {
        this.methodPropertyName = methodPropertyName;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnDefault() {
        return columnDefault;
    }

    public void setColumnDefault(String columnDefault) {
        this.columnDefault = columnDefault;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }
}

