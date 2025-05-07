/* eslint-disable ember/no-computed-properties-in-native-classes, ember/no-get, ember/require-computed-property-dependencies */
import Model, { attr, belongsTo, hasMany } from '@ember-data/model';

export default class SubmissionModel extends Model {
  /** Possible values: not-started, in-progress, accepted */
  @attr('string', {
    defaultValue: 'not-started',
  })
  aggregatedDepositStatus;
  @attr('date') submittedDate;
  @attr('string', { defaultValue: 'pass' }) source;
  @attr('string') metadata;
  @attr('boolean', { defaultValue: false }) submitted;
  @attr('string') submissionStatus;
  @attr('string') submitterName;
  @attr('string', {
    defaultValue: null,
  })
  submitterEmail;
  @attr('number') version;

  @hasMany('repository', { async: true, inverse: null }) repositories;
  @belongsTo('publication', { async: true, inverse: null }) publication;
  /**
   * List of grants related to the item being submitted. The grant PI determines who can perform
   * the submission and in the case that there are mutliple associated grants, they all should
   * have the same PI. If a grant has a different PI, it should be a separate submission.
   */
  @hasMany('grant', {
    async: true,
    inverse: 'submission',
  })
  grants;
}

export const SubmissionStatus = {
  DRAFT: 'DRAFT',
  MANUSCRIPT_REQUIRED: 'MANUSCRIPT_REQUIRED',
  APPROVAL_REQUESTED: 'APPROVAL_REQUESTED',
  CHANGES_REQUESTED: 'CHANGES_REQUESTED',
  CANCELLED: 'CANCELLED',
  SUBMITTED: 'SUBMITTED',
  NEEDS_ATTENTION: 'NEEDS_ATTENTION',
  COMPLETE: 'COMPLETE',
};

export const AggregatedDepositStatus = {
  NOT_STARTED: 'NOT_STARTED',
  IN_PROGRESS: 'IN_PROGRESS',
  FAILED: 'FAILED',
  ACCEPTED: 'ACCEPTED',
  REJECTED: 'REJECTED',
};

export const Source = {
  PASS: 'PASS',
  OTHER: 'OTHER',
};
