"use client";

import { zodResolver } from "@hookform/resolvers/zod";
import { useForm } from "react-hook-form";
import { Dispatch, SetStateAction, useEffect } from "react";
import InputField from "../InputField";
import { useFormState } from "react-dom";
import { toast } from "react-toastify";
import { useRouter } from "next/navigation";
import { announcementSchema, AnnouncementSchema } from "@/lib/formValidationSchemas";
import { createAnnouncement } from "@/lib/actions";

const AnnouncementForm = ({
  type,
  setOpen,
  data,
  relatedData,
}: {
  type: "create" | "update";
  setOpen: Dispatch<SetStateAction<boolean>>;
  data?: any;
  relatedData?: { classes: { id: number; name: string }[] };
}) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<AnnouncementSchema>({
    resolver: zodResolver(announcementSchema),
  });

  const [state, formAction] = useFormState(createAnnouncement, {
    success: false,
    error: false,
  });

  const router = useRouter();

  useEffect(() => {
    if (state.success) {
      toast("Announcement has been created!");
      setOpen(false);
      router.refresh();
    }
  }, [state, router, setOpen]);

  const onSubmit = handleSubmit((formData) => {
    formAction(formData);
  });

  return (
    <form className="flex flex-col gap-8" onSubmit={onSubmit}>
      <h1 className="text-xl font-semibold">Create Announcement</h1>

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
        label="Date"
        name="date"
        type="date"
        defaultValue={new Date().toISOString().split("T")[0]}
        register={register}
        error={errors.date}
      />

      <div className="flex flex-col gap-2">
        <label className="text-xs text-gray-500">Class (optional)</label>
        <select
          {...register("classId")}
          className="ring-[1.5px] ring-gray-300 p-2 rounded-md text-sm"
          defaultValue=""
              >
          <option value="">Global Announcement (All Classes)</option>
          {relatedData?.classes?.map((cls: { id: number; name: string }) => (
          <option key={cls.id} value={cls.id}>
          {cls.name}
            </option>
            ))}
        </select>

        {errors.classId && (
          <p className="text-xs text-red-400">{errors.classId.message}</p>
        )}
      </div>

      {state.error && <p className="text-red-500">Something went wrong!</p>}

      <button type="submit" className="bg-blue-500 text-white p-2 rounded-md">
        Create
      </button>
    </form>
  );
};

export default AnnouncementForm;
