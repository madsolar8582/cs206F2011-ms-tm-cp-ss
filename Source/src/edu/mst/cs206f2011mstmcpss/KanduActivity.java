package edu.mst.cs206f2011mstmcpss;

import android.app.ListActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;

public class KanduActivity extends ListActivity {
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		// setContentView(R.layout.main);
		setListAdapter(ArrayAdapter.createFromResource(getApplicationContext(),
				R.array.Activites, R.layout.main));
	}
}