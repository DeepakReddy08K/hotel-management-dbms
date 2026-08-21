-- HOTEL MANAGEMENT SYSTEM


-- 1. CHANGE ROOM STATUS AFTER BOOKING INSERT
CREATE OR REPLACE FUNCTION change_room_status_on_insert()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE room
    SET status = 'BOOKED'
    WHERE room_id = NEW.room_id;

    RETURN NEW;
END;
$$;


CREATE TRIGGER change_room_status_on_insert
AFTER INSERT ON booking
FOR EACH ROW
EXECUTE FUNCTION change_room_status_on_insert();


-- 2. CHANGE ROOM STATUS AFTER BOOKING DELETE
CREATE OR REPLACE FUNCTION change_room_status_on_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE room
    SET status = 'AVAILABLE'
    WHERE room_id = OLD.room_id;

    RETURN OLD;
END;
$$;


CREATE TRIGGER change_room_status_on_delete
AFTER DELETE ON booking
FOR EACH ROW
EXECUTE FUNCTION change_room_status_on_delete();


-- 3. CHANGE ROOM STATUS AFTER BOOKING UPDATE
CREATE OR REPLACE FUNCTION change_room_status_on_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    IF NEW.status = 'COMPLETED' THEN

        UPDATE room
        SET status = 'AVAILABLE'
        WHERE room_id = NEW.room_id;

    ELSIF NEW.status = 'CANCELLED' THEN

        UPDATE room
        SET status = 'AVAILABLE'
        WHERE room_id = NEW.room_id;

    ELSIF NEW.status = 'CONFIRMED' THEN

        UPDATE room
        SET status = 'BOOKED'
        WHERE room_id = NEW.room_id;

    END IF;

    RETURN NEW;
END;
$$;


CREATE TRIGGER change_room_status_on_update
AFTER UPDATE ON booking
FOR EACH ROW
EXECUTE FUNCTION change_room_status_on_update();