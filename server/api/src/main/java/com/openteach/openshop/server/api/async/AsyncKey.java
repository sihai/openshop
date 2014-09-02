package com.openteach.openshop.server.api.async;

import java.io.Serializable;

/**
 * 
 * @author sihai
 *
 */
public class AsyncKey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -627286094702884825L;
	
	private long id;
	
	/**
	 * 
	 * @param id
	 */
	public AsyncKey(long id) {
		this.id = id;
	}
	
	@Override
	public int hashCode() {
		return (int)id;
	}
	
	@Override
	public boolean equals(Object o) {
		if(this == o) {
			return true;
		}
		if(!(o instanceof AsyncKey)) {
			return false;
		}
		
		return ((AsyncKey)o).id == id;
	}
}
