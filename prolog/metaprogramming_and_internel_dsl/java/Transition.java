public class Transition {

    private State source;
    private Event trigger;
    private State target;

    public Transition(State source, Event trigger, State target) {
        this.source = source;
        this.trigger = trigger;
        this.target = target;
    }

    public State getSource() {return source;}
    public State getTarget() {return target;}
    public Event getTrigger() {return trigger;}
    public String getEventCode() {return trigger.getCode();}

}
