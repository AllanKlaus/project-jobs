require 'rails_helper'

describe "#recent?" do

  context "created now" do
    it "is recent" do
      job = create_job
      expect(job).to_not be_recent
    end
  end

  context "created 5 days ago" do
    it "is not recent" do
      job = nil
      travel_to 5.days.ago do
        job = create_job
      end
      expect(job).to_not be_recent
    end
  end

  context "created 89 days ago" do
    it "is expired" do
      job = nil
      travel_to 89.days.ago do
        job = create_job
      end
      expect(job).to_not be_expired
    end
  end

  context "created 90 days ago" do
    it "is not expired" do
      job = nil
      travel_to 90.days.ago do
        job = create_job
      end
      expect(job).to be_expired
    end
  end

  context "created 91 days ago" do
    it "is expired" do
      job = nil
      travel_to 95.days.ago do
        job = create_job
      end
      expect(job).to be_expired
    end
  end

  context "created 100 days ago" do
    it "is expired" do
      job = nil
      travel_to 100.days.ago do
        job = create_job
      end
      expect(job).to be_expired
    end
  end

end
