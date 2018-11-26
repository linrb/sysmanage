package com.lin.sysmanage.utils.pdf;

public class MyRectangle {
    private float width;
    private float left;
    private float right;
    private float bottom;
    private float top;
    private float height;
    /**
     * 行间间隔
     */
    private float lineSpace;
    /**
     * 最小行间距，从上一行底部到下一行底部的距离
     */
    private float minlineHeight;

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getLeft() {
        return left;
    }

    public void setLeft(float left) {
        this.left = left;
    }

    public float getRight() {
        return right;
    }

    public void setRight(float right) {
        this.right = right;
    }

    public float getBottom() {
        return bottom;
    }

    public void setBottom(float bottom) {
        this.bottom = bottom;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getLineSpace() {
        return lineSpace;
    }

    public void setLineSpace(float lineSpace) {
        this.lineSpace = lineSpace;
    }

    public float getMinlineHeight() {
        return minlineHeight;
    }

    public void setMinlineHeight(float minlineHeight) {
        this.minlineHeight = minlineHeight;
    }

    public float getTop() {
        return top;
    }

    public void setTop(float top) {
        this.top = top;
    }
}
