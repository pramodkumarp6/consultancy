package pramod.consultency.com.users.adapter;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

import pramod.consultency.com.users.R;
import pramod.consultency.com.users.model.ListItem;


public class InterviewAdapter extends RecyclerView.Adapter<InterviewAdapter.ViewHolder>{
    private List<ListItem> listItems;
    private Context context;


    public InterviewAdapter(List<ListItem> listItems, Context context) {
        this.listItems = listItems;
        this.context = context;
    }


    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.list_ltem,parent,false);

        return  new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        ListItem listItem = listItems.get(position);
        holder.Condidate_name.setText(listItem.getCondiatename());
        holder.condiate_email.setText(listItem.getEmail());
        holder.Condidate_company.setText(listItem.getCompany());
        holder.Condidate_job.setText(listItem.getJob());
        holder.Condidate_interviewdate.setText(listItem.getInterviewdate());
        holder.Condidate_address.setText(listItem.getAddress());
        holder.Condidate_contractMobile.setText(listItem.getContractMobile());
        holder.Condidate_contractName.setText(listItem.getContractName());

    }

    @Override
    public int getItemCount() {
        return listItems.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        public TextView Condidate_name;
        public TextView condiate_email;
        public TextView Condidate_company;
        public TextView Condidate_job;
        public TextView Condidate_interviewdate;
        public TextView Condidate_address;

        public TextView Condidate_contractMobile;
        public TextView Condidate_contractName;



        public ViewHolder(View itemView) {
            super(itemView);
            Condidate_name = itemView.findViewById(R.id.name);
            condiate_email = itemView.findViewById(R.id.email);
            Condidate_company = itemView.findViewById(R.id.company);
            Condidate_job = itemView.findViewById(R.id.job);
            Condidate_interviewdate = itemView.findViewById(R.id.intervie_date);
            Condidate_address = itemView.findViewById(R.id.address);
            Condidate_contractMobile = itemView.findViewById(R.id.contract_mob);
            Condidate_contractName = itemView.findViewById(R.id.contract_person);
        }
    }

}