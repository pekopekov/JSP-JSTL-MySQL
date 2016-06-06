package entities;
// Generated Jun 5, 2016 1:04:58 PM by Hibernate Tools 5.1.0.Alpha1

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * TMailId generated by hbm2java
 */
@Embeddable
public class TMailId implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -69919367137751424L;
	
	private int id;
	private int TPeopleId;

	public TMailId() {
	}

	public TMailId(int id, int TPeopleId) {
		this.id = id;
		this.TPeopleId = TPeopleId;
	}

	@Column(name = "ID", nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "T_PEOPLE_ID", nullable = false)
	public int getTPeopleId() {
		return this.TPeopleId;
	}

	public void setTPeopleId(int TPeopleId) {
		this.TPeopleId = TPeopleId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof TMailId))
			return false;
		TMailId castOther = (TMailId) other;

		return (this.getId() == castOther.getId()) && (this.getTPeopleId() == castOther.getTPeopleId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getId();
		result = 37 * result + this.getTPeopleId();
		return result;
	}

}
