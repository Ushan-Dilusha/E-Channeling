package model;

public class DocApp {
int id;
int appointmentID;
String time;
String Status;
int docId;

public int getDocId() {
	return docId;
}
public void setDocId(int docId) {
	this.docId = docId;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getAppointmentID() {
	return appointmentID;
}
public void setAppointmentID(int appId) {
	this.appointmentID = appId;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getStatus() {
	return Status;
}
public void setStatus(String status) {
	Status = status;
}
}
