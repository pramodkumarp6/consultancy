package pramod.consultency.com.users.model;

public class ListItem {

    private String condiatename;
    private String email;
    private String company;
    private String job;
    private String interviewdate;
    private String address;
    private String contractMobile;
    private String contractName;

    public ListItem(String condiatename, String email, String company, String job, String interviewdate, String address, String contractMobile, String contractName) {
        this.condiatename = condiatename;
        this.email = email;
        this.company = company;
        this.job = job;
        this.interviewdate = interviewdate;
        this.address = address;
        this.contractMobile = contractMobile;
        this.contractName = contractName;
    }

    public String getCondiatename() {
        return condiatename;
    }

    public String getEmail() {
        return email;
    }

    public String getCompany() {
        return company;
    }

    public String getJob() {
        return job;
    }

    public String getInterviewdate() {
        return interviewdate;
    }

    public String getAddress() {
        return address;
    }

    public String getContractMobile() {
        return contractMobile;
    }

    public String getContractName() {
        return contractName;
    }

}