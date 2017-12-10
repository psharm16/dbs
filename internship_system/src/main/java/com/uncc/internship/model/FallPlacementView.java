package com.uncc.internship.model;

import java.io.Serializable;

public class FallPlacementView implements Serializable {

	private static final long serialVersionUID = -3465813074586302847L;
	/**
	 * CREATE OR REPLACE VIEW `FallPlacement` AS SELECT * FROM Placement WHERE
	 * PlacementID IN (SELECT ApplicationID FROM Application WHERE StudentID IN
	 * (SELECT StudentID FROM student WHERE semester='Fall'));
	 * 
	 */

}
