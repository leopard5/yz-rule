package com.yz.rule.enums;

/**
 * @author yazhong
 */
public enum ActionEnum {
    /**
     *
     */
    BOOKING((byte) 1),
    /**
     *
     */
    BOOKING_LINE((byte) 2),
    ;

    private byte value;

    ActionEnum(byte value) {
        this.value = value;
    }

    public byte getValue() {
        return value;
    }

    public static boolean exists(Byte status) {
        if (status == null) {
            return false;
        }
        byte s = status.byteValue();
        return exists(s);
    }

    public static boolean exists(byte s) {
        for (ActionEnum element : ActionEnum.values()) {
            if (element.value == s) {
                return true;
            }
        }
        return false;
    }

    public boolean equal(Byte val) {
        return val == null ? false : val.byteValue() == this.value;
    }
}
