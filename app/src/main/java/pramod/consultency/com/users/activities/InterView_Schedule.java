package pramod.consultency.com.users.activities;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.DatePicker;
import android.widget.EditText;

import pramod.consultency.com.users.R;
import pramod.consultency.com.users.adapter.InterviewAdapter;
import pramod.consultency.com.users.model.ListItem;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class InterView_Schedule extends AppCompatActivity {

    private RecyclerView recyclerView;

    private InterviewAdapter interviewAdapter;
    private List<ListItem> listItems;
    private DatePickerDialog.OnDateSetListener mDateSetListener;
    private String TAG;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_inter_view__schedule);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setTitle("InterView Schedule");



            recyclerView =findViewById(R.id.recyclerView);
            recyclerView.setLayoutManager(new LinearLayoutManager(this));
            recyclerView.setHasFixedSize(true);

            listItems = new ArrayList<>();
            ListItem listItem =new ListItem("PRAMOD KUMAR PANDEY","pramodkumarp6@gmail.com","Gravitational pvt Ltd","Android Developer","15/12/2015","Noida Sector 63 ","9717194480","Raj KUMAR SINGH");

            listItems.add(listItem);
            interviewAdapter =new InterviewAdapter(listItems,this);
            recyclerView.setAdapter(interviewAdapter);
        }



    public boolean onOptionsItemSelected(MenuItem menuItem)
    {    int id = menuItem.getItemId();

        if(id== android.R.id.home)
        {
            this.finish();
        }
        return super.onOptionsItemSelected(menuItem);
    }
}