package model;

public class Room {
    private int roomId;
    private String tenantName;
    private String phone;
    private String startDate;
    private int paymentId;
    private String paymentName;
    private String note;

    public Room() {}

    public Room(int roomId, String tenantName, String phone, String startDate, int paymentId, String paymentName, String note) {
        this.roomId = roomId;
        this.tenantName = tenantName;
        this.phone = phone;
        this.startDate = startDate;
        this.paymentId = paymentId;
        this.paymentName = paymentName;
        this.note = note;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
