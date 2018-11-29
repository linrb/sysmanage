package com.lin.sysmanage.utils.pdf;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.geom.Vector;
import com.itextpdf.kernel.pdf.canvas.parser.EventType;
import com.itextpdf.kernel.pdf.canvas.parser.data.IEventData;
import com.itextpdf.kernel.pdf.canvas.parser.data.TextRenderInfo;
import com.itextpdf.kernel.pdf.canvas.parser.listener.IEventListener;

import java.util.*;

/**
 * itextpdf段落事件监听
 */
public class MyPdfEventListener implements IEventListener {
    private List<Rectangle> rectangles = new ArrayList<>();
    
    @Override
    public void eventOccurred(IEventData iEventData, EventType eventType) {
        if (eventType == EventType.RENDER_TEXT) {
            TextRenderInfo renderInfo = (TextRenderInfo) iEventData;
            if ("".equals(renderInfo.getText().trim())) {
                return;
            }
            Vector startPoint = renderInfo.getDescentLine().getStartPoint();
            Vector endPoint = renderInfo.getAscentLine().getEndPoint();
            float x1 = Math.min(startPoint.get(0), endPoint.get(0));
            float x2 = Math.max(startPoint.get(0), endPoint.get(0));
            float y1 = Math.min(startPoint.get(1), endPoint.get(1));
            float y2 = Math.max(startPoint.get(1), endPoint.get(1));
            rectangles.add(new Rectangle(x1, y1, x2 - x1, y2 - y1));
        }
    }

    @Override
    public Set<EventType> getSupportedEvents() {
        return new LinkedHashSet<>(Collections.singletonList(EventType.RENDER_TEXT));
    }

    public List<Rectangle> getRectangles() {
        return rectangles;
    }

    public void clear() {
        rectangles.clear();
    }
}
