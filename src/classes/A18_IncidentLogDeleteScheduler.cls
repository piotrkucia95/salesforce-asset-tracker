/**
 * Created by Piotr Kucia on 17.07.2018.
 */

global class A18_IncidentLogDeleteScheduler implements Schedulable {

    global void execute(SchedulableContext sc) {
        A18_IncidentLogDeleteBatchClass batchClass = new A18_IncidentLogDeleteBatchClass();
        Database.executeBatch(batchClass, 200);
    }
}