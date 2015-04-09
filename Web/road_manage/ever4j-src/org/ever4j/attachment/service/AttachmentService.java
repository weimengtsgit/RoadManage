package org.ever4j.attachment.service;

import javax.annotation.Resource;

import org.ever4j.attachment.entity.Attachment;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AttachmentService extends BaseService<Attachment> {
	@Override
	@Resource(name="attachmentDao")
	public void setBaseDao(BaseDao<Attachment> baseDao){
		this.baseDao = baseDao;
	}
}
