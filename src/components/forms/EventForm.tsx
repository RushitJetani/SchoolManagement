"use client";

import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { Dispatch, SetStateAction, useEffect } from "react";
import InputField from "../InputField";
import { useFormState } from "react-dom";
import { useRouter } from "next/navigation";
import { toast } from "react-toastify";
import { eventSchema, EventSchema } from "@/lib/formValidationSchemas";
import { createEvent, updateEvent } from "@/lib/actions";

const EventForm = ({
  type,
  data,
  setOpen,
  relatedData,
}: {
  type: "create" | "update";
  data?: any;
  setOpen: Dispatch<SetStateAction<boolean>>;
  relatedData?: { classes: { id: number; name: string }[] };
}) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<EventSchema>({
    resolver: zodResolver(eventSchema),
  });

  const [state, formAction] = useFormState(
    type === "create" ? createEvent : updateEvent,
    { success: false, error: false }
  );

  const router = useRouter();

  useEffect(() => {
    if (state.success) {
      toast(`Event has been ${type === "create" ? "created" : "updated"}!`);
      setOpen(false);
      router.refresh();
    }
  }, [state, setOpen, router, type]);

  const onSubmit = handleSubmit((formData) => {
    formAction({ ...formData, id: data?.id });
  });

  return (
    <form className="flex flex-col gap-8" onSubmit={onSubmit}>
      <h1 className="text-xl font-semibold">
        {type === "create" ? "Create Event" : "Update Event"}
      </h1>

      <InputField
        label="Title"
        name="title"
        defaultValue={data?.title}
        register={register}
        error={errors.title}
      />

      <div className="flex flex-col gap-2">
        <label className="text-xs text-gray-500">Description</label>
        <textarea
          rows={4}
          className="ring-[1.5px] ring-gray-300 p-2 rounded-md text-sm"
          {...register("description")}
          defaultValue={data?.description}
        />
        {errors.description && (
          <p className="text-xs text-red-400">{errors.description.message}</p>
        )}
      </div>

      <InputField
        label="Start Time"
        name="startTime"
        type="datetime-local"
        defaultValue={
          data?.startTime
            ? new Date(data.startTime).toISOString().slice(0, 16)
            : ""
        }
        register={register}
        error={errors.startTime}
      />

      <InputField
        label="End Time"
        name="endTime"
        type="datetime-local"
        defaultValue={
          data?.endTime
            ? new Date(data.endTime).toISOString().slice(0, 16)
            : ""
        }
        register={register}
        error={errors.endTime}
      />

      <div className="flex flex-col gap-2">
        <label className="text-xs text-gray-500">Class (optional)</label>
        <select
          {...register("classId")}
          className="ring-[1.5px] ring-gray-300 p-2 rounded-md text-sm"
          defaultValue={data?.classId ?? ""}
        >
          <option value="">Global Event (All Classes)</option>
          {relatedData?.classes?.map((cls) => (
            <option key={cls.id} value={cls.id}>
              {cls.name}
            </option>
          ))}
        </select>
        {errors.classId && (
          <p className="text-xs text-red-400">{errors.classId.message}</p>
        )}
      </div>

      {state.error && (
        <p className="text-xs text-red-500">Something went wrong!</p>
      )}

      <button type="submit" className="bg-blue-500 text-white p-2 rounded-md">
        {type === "create" ? "Create" : "Update"}
      </button>
    </form>
  );
};

export default EventForm;
